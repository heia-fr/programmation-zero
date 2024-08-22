prefix := "/"

serve:
    #!/usr/bin/env bash
    poetry run mkdocs serve

clean:
    #!/usr/bin/env bash
    rm -Rf public

