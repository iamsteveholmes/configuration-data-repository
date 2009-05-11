class CDRTagLib {
    static namespace = "cdr"

    def className = {attrs, body ->
        def name = attrs['name']
        name = name[0].toLowerCase() + name[1..name.size() - 1]
        out << name
    }
}