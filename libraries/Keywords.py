from SeleniumLibrary import SeleniumLibrary
import datetime
import os
from robot.api.deco import keyword


class CustomKeywords:
    def __init__(self):
        self.selib = SeleniumLibrary()

    @keyword
    def capture_screenshot_with_timestamp(self, screenshot_dir):
        """Capture screenshot with a timestamp."""
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        filename = os.path.join(screenshot_dir, f"screenshot_{timestamp}.png")
        self.selib.capture_page_screenshot(filename)
        return filename

    @keyword
    def click_element_if_visible(self, locator, timeout=5):
        """Click an element if it is visible within a timeout."""
        is_visible = self.selib.run_keyword_and_return_status(
            "Wait Until Element Is Visible", locator, timeout=f"{timeout}s"
        )
        if is_visible:
            self.selib.click_element(locator)
        return is_visible

    @keyword
    def wait_and_input_text(self, locator, text):
        """Wait for a field to be visible and input text."""
        self.selib.wait_until_element_is_visible(locator, timeout=10)
        self.selib.input_text(locator, text)

    @keyword
    def scroll_and_click(self, locator):
        """Scroll to an element and click it."""
        self.selib.execute_javascript("arguments[0].scrollIntoView();", self.selib.find_element(locator))
        self.selib.click_element(locator)

    @keyword
    def wait_for_and_click(self, locator):
        """Wait for an element to be visible and click."""
        self.selib.wait_until_element_is_visible(locator, timeout=10)
        self.selib.click_element(locator)

    @keyword
    def upload_file(self, locator, file_path):
        """Upload a file to the specified element."""
        self.selib.choose_file(locator, file_path)
