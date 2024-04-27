import logging
from fastapi import FastAPI, Form, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from nameko.standalone.rpc import ClusterRpcProxy

config = {
    'AMQP_URI': 'pyamqp://hyc-admin:Thepassword@rabbitmq'
}

# Create a custom stream handler to log to standard output
class StandardOutHandler(logging.StreamHandler):
    def __init__(self):
        super().__init__()
        self.stream = None  # Set to sys.stdout later

# Configure logging with the custom stream handler
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
handler = StandardOutHandler()
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

app = FastAPI()
templates = Jinja2Templates(directory="templates")

def get_encouragement_from_inspire_service(gratitude: str):
    """RPC call to inspire service"""
    logger.info(f"Calling RPC to generate encouragement with gratitude: {gratitude}")
    with ClusterRpcProxy(config) as cluster_rpc:
        res = cluster_rpc.inspire_service.generate_encouragement.call_async(gratitude)
        encouragement = res.result()
        logger.info(f"Received encouragement: {encouragement}")
        return encouragement

@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    logger.info("Rendering home page")
    return templates.TemplateResponse("index.html", {"request": request})

@app.post("/", response_class=HTMLResponse)
async def get_encouragement(request: Request, gratitude: str = Form(...), your_name: str = Form(...)):
    logger.info(f"Received form submission: gratitude={gratitude}, your_name={your_name}")
      
    # Combine user input and encouragement
    encouragement = get_encouragement_from_inspire_service(gratitude)
    logger.info("Rendering result page")
    return templates.TemplateResponse("result.html", {"request": request, 
                                                      "gratitude": gratitude,
                                                      "your_name": your_name, 
                                                      "encouragement": encouragement})
