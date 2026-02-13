from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import time

class CustomLibrary:
    def __init__(self):
        self._sel_lib = None

    @property
    def sel_lib(self):
        if self._sel_lib is None:
            self._sel_lib = BuiltIn().get_library_instance('SeleniumLibrary')
        return self._sel_lib

    @keyword
    def scroll_to_element_and_click(self, locator, timeout=30):
        self.sel_lib.wait_until_page_contains_element(locator, timeout=timeout)
        element = self.sel_lib.find_element(locator)
        self.sel_lib.driver.execute_script("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", element)
        time.sleep(1)
        self.sel_lib.wait_until_element_is_visible(locator, timeout=timeout)
        self.highlight_element(locator)
        self.sel_lib.driver.execute_script("arguments[0].click();", element)

    @keyword
    def highlight_and_click(self, locator):
        self.highlight_element(locator)
        self.sel_lib.click_element(locator)

    @keyword
    def highlight_element(self, locator):
        element = self.sel_lib.find_element(locator)
        driver = self.sel_lib.driver
        driver.execute_script("arguments[0].setAttribute('style', 'border: 3px solid red;');", element)
        time.sleep(0.5)
