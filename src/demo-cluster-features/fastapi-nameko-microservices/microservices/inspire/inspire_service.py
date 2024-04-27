import logging
import random
from nameko.rpc import rpc

encouragements = [
    "You're doing great!",
    "Keep up the good work!",
    "You're awesome!",
    "You've got this!",
    "Stay positive!",
    "You're making progress!",
    "Believe in yourself!",
    "Keep pushing forward!",
    "Stay motivated!",
    "You're making a difference!",
    "You're on the right track!",
    "Stay strong!",
    "You're capable of great things!",
    "You're an inspiration!",
    "Stay focused!",
    "You're unstoppable!",
    "You're doing amazing!",
    "You're a star!",
    "Stay determined!",
    "You're fantastic!"
]

# Create a custom logger for InspireService
logger = logging.getLogger("InspireService")
logger.setLevel(logging.INFO)
handler = logging.StreamHandler()
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

class InspireService:
    name = "inspire_service"

    @rpc
    def generate_encouragement(self, gratitude: str) -> str:
        # Log the received gratitude
        logger.info(f"Received gratitude: {gratitude}")

        # Select a random encouragement
        encouragement = random.choice(encouragements)

        # Log the selected encouragement
        logger.info(f"Selected encouragement: {encouragement}")

        response = f"""
            *****************************************
            I'm glad you are grateful for {gratitude}

            {encouragement}

            signed: Your Friend
            ****************************************  
        """

        return response
