import pyautogui
import time
import os
from selenium.webdriver.common.by import By
from robot.api import logger
from SeleniumLibrary import SeleniumLibrary
def press_f12():
    """Simulates pressing the F12 key."""
    pyautogui.press('f12')
    
def take_screenshot():
    """Captures a screenshot of the entire screen and saves it with a timestamped filename."""
    # Generate a unique screenshot filename based on the current time
    timestamp = time.strftime("%Y%m%d_%H%M%S")
    screenshot_name = f"screenshot_{timestamp}.png"

    # Ensure the screenshots directory exists
    screenshots_dir = os.path.join(os.getcwd(), 'tests', 'screenshots')
    if not os.path.exists(screenshots_dir):
        os.makedirs(screenshots_dir)

    # Save the screenshot in the 'tests/screenshots' folder
    screenshot_path = os.path.join(screenshots_dir, screenshot_name)
    pyautogui.screenshot(screenshot_path)

    # Log the screenshot path in Robot Framework logs
    logger.info(f"Screenshot saved at: {screenshot_path}")

    # To make the image accessible in the HTML report, use a relative path
    relative_path = os.path.relpath(screenshot_path, os.getcwd())  # relative to the project root

    # Log the screenshot with HTML img tag
    logger.console(f"Screenshot saved at: {relative_path}")
    logger.console(f"<img src='{relative_path}' alt='Screenshot' />")

    return screenshot_path
    