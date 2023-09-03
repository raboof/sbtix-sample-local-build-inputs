name := "sbtix-sample-local-build-inputs"

scalaVersion := "3.3.0"

enablePlugins(JavaAppPackaging)

libraryDependencies ++= Seq(
  "net.ruippeixotog" %% "scala-scraper" % "3.1.1-SNAPSHOT",
)
