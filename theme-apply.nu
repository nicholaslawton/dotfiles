# Generates all config files from templates using the central theme.toml

def main [] {
    if not ("theme.toml" | path exists) {
        print "Theme file theme.toml does not exist"
        return
    }

    glob **/*.tmpl | each {|x| generate $x} | ignore
}

def generate [template: string] {
    print $"Generating ($template)"
    let product = ($template | str replace ".tmpl" "")
    let staged = $product + ".tmp"

    let result = (try {
        gomplate -f $template -o $staged -c .=./theme.toml
        $env.LAST_EXIT_CODE
    } catch {
        print $"Error running gomplate: ($in)"
        -1
    })

    if $result == 0 {
        mv $staged $product
        print $"Successfully generated ($product)"
    } else {
        rm -f $staged
        print $"Failed to generate ($product) with exit code ($result)"
    }
}
