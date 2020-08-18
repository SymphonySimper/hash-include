class Lang {
  int langId;
  String langName;
  String language;
  int maxVersion;
  Lang({this.langId, this.langName, this.language, this.maxVersion});

  static List<Lang> getLang() {
    return <Lang>[
      Lang(langId: 1, langName: "Ada", language: "ada", maxVersion: 3),
      Lang(
          langId: 2,
          langName: "Assembler - NASM",
          language: "nasm",
          maxVersion: 3),
      Lang(
          langId: 3,
          langName: "Assembler - GCC",
          language: "gccasm",
          maxVersion: 2),
      Lang(langId: 4, langName: "BC", language: "bs", maxVersion: 1),
      Lang(langId: 5, langName: "Bash Shell", language: "bash", maxVersion: 3),
      Lang(
          langId: 6,
          langName: "Brain f**k",
          language: "brainfuck",
          maxVersion: 0),
      Lang(langId: 7, langName: "C", language: "c", maxVersion: 4),
      Lang(langId: 8, langName: "C++", language: "cpp", maxVersion: 4),
      Lang(langId: 9, langName: "CLISP", language: "clisp", maxVersion: 3),
      Lang(
          langId: 10,
          langName: "Coffee Script",
          language: "coffeescript",
          maxVersion: 3),
      Lang(langId: 11, langName: "Clojure", language: "clojure", maxVersion: 2),
      Lang(langId: 12, langName: "Cobol", language: "cobol", maxVersion: 2),
      Lang(langId: 13, langName: "C#", language: "csharp", maxVersion: 3),
      Lang(langId: 14, langName: "D", language: "d", maxVersion: 1),
      Lang(langId: 15, langName: "Dart", language: "dart", maxVersion: 3),
      Lang(langId: 16, langName: "Erlang", language: "erlang", maxVersion: 0),
      Lang(langId: 17, langName: "Elixir", language: "elixir", maxVersion: 3),
      Lang(langId: 18, langName: "Fortran", language: "fortran", maxVersion: 3),
      Lang(langId: 19, langName: "Forth", language: "forth", maxVersion: 0),
      Lang(langId: 20, langName: "F#", language: "fsharp", maxVersion: 1),
      Lang(langId: 21, langName: "Factor", language: "factor", maxVersion: 3),
      Lang(langId: 22, langName: "Falcon", language: "falcon", maxVersion: 0),
      Lang(
          langId: 23,
          langName: "FREE BASIC",
          language: "freebasic",
          maxVersion: 1),
      Lang(langId: 24, langName: "Fantom", language: "fantom", maxVersion: 0),
      Lang(langId: 25, langName: "GoLang", language: "go", maxVersion: 3),
      Lang(langId: 26, langName: "Groovy", language: "groovy", maxVersion: 3),
      Lang(langId: 27, langName: "Haskell", language: "haskell", maxVersion: 3),
      Lang(langId: 28, langName: "Hack", language: "hack", maxVersion: 0),
      Lang(langId: 29, langName: "Icon", language: "icon", maxVersion: 1),
      Lang(
          langId: 30,
          langName: "Intercal",
          language: "intercal",
          maxVersion: 0),
      Lang(langId: 31, langName: "J", language: "jlang", maxVersion: 0),
      Lang(langId: 32, langName: "Java", language: "java", maxVersion: 3),
      Lang(langId: 33, langName: "Kotlin", language: "kotlin", maxVersion: 2),
      Lang(langId: 34, langName: "Lua", language: "lua", maxVersion: 2),
      Lang(langId: 35, langName: "LOLCODE", language: "lolcode", maxVersion: 0),
      Lang(langId: 36, langName: "Nemerle", language: "nemerle", maxVersion: 0),
      Lang(langId: 37, langName: "Node JS", language: "nodejs", maxVersion: 3),
      Lang(langId: 38, langName: "Nim", language: "nim", maxVersion: 2),
      Lang(
          langId: 39, langName: "OZ Mozart", language: "mozart", maxVersion: 0),
      Lang(langId: 40, langName: "Objective C", language: "obc", maxVersion: 3),
      Lang(langId: 41, langName: "Ocaml", language: "ocaml", maxVersion: 1),
      Lang(langId: 42, langName: "Octave", language: "octave", maxVersion: 3),
      Lang(langId: 43, langName: "Python2", language: "python2", maxVersion: 2),
      Lang(langId: 44, langName: "Python3", language: "python3", maxVersion: 3),
      Lang(langId: 45, langName: "PHP", language: "php", maxVersion: 3),
      Lang(langId: 46, langName: "Perl", language: "perl", maxVersion: 3),
      Lang(
          langId: 47,
          langName: "Picolisp",
          language: "picolisp",
          maxVersion: 3),
      Lang(langId: 48, langName: "Pascal", language: "pascal", maxVersion: 2),
      Lang(langId: 49, langName: "Prolog", language: "prolog", maxVersion: 1),
      Lang(langId: 50, langName: "Pike", language: "pike", maxVersion: 1),
      Lang(langId: 51, langName: "Rhino JS", language: "rhino", maxVersion: 1),
      Lang(langId: 52, langName: "Ruby", language: "ruby", maxVersion: 3),
      Lang(langId: 53, langName: "RUST", language: "jlang", maxVersion: 3),
      Lang(langId: 54, langName: "R Language", language: "r", maxVersion: 3),
      Lang(langId: 55, langName: "Racket", language: "racket", maxVersion: 2),
      Lang(langId: 56, langName: "Scala", language: "scala", maxVersion: 3),
      Lang(langId: 57, langName: "SQL", language: "sql", maxVersion: 3),
      Lang(langId: 58, langName: "Swift", language: "swift", maxVersion: 3),
      Lang(langId: 58, langName: "Scheme", language: "scheme", maxVersion: 2),
      Lang(
          langId: 60,
          langName: "SpiderMonkey",
          language: "spidermondey",
          maxVersion: 1),
      Lang(
          langId: 61,
          langName: "Small talk",
          language: "smalltalk",
          maxVersion: 0),
      Lang(langId: 62, langName: "TCL", language: "tcl", maxVersion: 3),
      Lang(
          langId: 63,
          langName: "Unlambda",
          language: "unlambda",
          maxVersion: 0),
      Lang(langId: 63, langName: "VB.net", language: "vbn", maxVersion: 3),
      Lang(langId: 65, langName: "VERILOG", language: "verilog", maxVersion: 2),
      Lang(
          langId: 66,
          langName: "White Space",
          language: "whitespace",
          maxVersion: 0),
      Lang(langId: 67, langName: "YaBasic", language: "yabasic", maxVersion: 1)
    ];
  }
}
