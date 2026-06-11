prefix := "/"

serve:
    #!/usr/bin/env bash
    uv run properdocs serve

clean:
    #!/usr/bin/env bash
    rm -Rf public

