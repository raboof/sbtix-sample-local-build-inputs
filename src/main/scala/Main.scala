import net.ruippeixotog.scalascraper.browser.JsoupBrowser
import org.apache.commons.vfs2.util.URIUtils

@main
def main =
  // Using a custom API from branch
  println(new JsoupBrowser().myCustomMethod())
  // Using a dependency that was not part of the original dependency:
  println(URIUtils.encodePath("@#$?"))

