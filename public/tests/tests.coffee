chai    = require 'chai'
expect  = chai.expect
routes  = require "../../routes/index.coffee"
main    = require("../javascripts/gramatica.js")

describe "Rutas", ->
  req = {}
  res = {}
  describe "Index", ->
    it "Debe existir una ruta index con el titulo del proyecto", ->
      res.render = (view, vars) ->
          expect(view).equal "index"
          expect(vars.title).equal "Críticas de Películas"
      routes.index(req, res)

describe "Parser", ->
  it "Parseo Ejemplo 1", ->
    result = gramatica.parse("'Marvel Los vengadores',2012{
        'The Hollywood Reporter' [
            'Whedon consigue una asombrosa hazaña equilibrando este circo de superhumanos, diseñado para hechizar el corazón geek al mismo tiempo que el de los no fans', 4;
        ]
        'Variety' [
            'Como un modelo de última generación construido de partes reconstituidas, el pletórico, boyante e ingeniosamente entretenido choque de superhéroes de Joss Whedon es un sofisticado escapismo', 3;
        ]
    }")

  it "Parseo Ejemplo 2", ->
    result = gramatica.parse("'Mad Max: Furia en la carretera',2015{
        'The Hollywood Reporter' [
            'Una reinvención brillantemente retorcida. Una aventura de acción delirantemente extraña, un trepidante Grand Theft Auto rediseñado por El Bosco.', 4;
        ]
        'Screendaily' [
            'La persecución sigue -y sigue y sigue- en Mad Max: Fury Road, una apisonadora de película de acción que es implacable, emocionante, agotadora y aturdidora a partes iguales.', 4;
        ]
    }")

  it "Parseo Ejemplo 3", ->
    result = gramatica.parse("'Star Wars. Episode V: The Empire Strikes Back',1980{
        'Chicago Sun-Times' [
            'La mejor de las películas Star Wars y la que más incita a la reflexión. Un espectáculo visual de principio a fin', 4;
        ]
        'Entertainment Weekly' [
            'La mejor de la trilogía. Un estimulante equilibrio de drama, humor y Profundos Pensamientos', 5;
        ]
    }")
