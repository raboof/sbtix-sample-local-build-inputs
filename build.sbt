name := "sbtix-sample-nix-managed-dependencies"

scalaVersion := "3.3.0"

enablePlugins(JavaAppPackaging)

libraryDependencies ++= Seq(
  // TODO depend on 3.1.1 from https://github.com/raboof/scala-scraper/tree/branch
  // instead
  "net.ruippeixotog" %% "scala-scraper" % "3.1.0",
)
