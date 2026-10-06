# SPOT-SG — SPOT Scene Graph

Extension of the [Space Types Ontology (SPOT)](https://w3id.org/spot) that aligns SPOT with the
[Geometry Metadata Ontology (GOM)](https://w3id.org/gom) and adds a compact
bounding box representation for spaces.

- Namespace: `https://w3id.org/spot/sg#` (prefix `spot-sg`)
- Source: [`ontology/spot-sg.ttl`](ontology/spot-sg.ttl)
- License: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

## Building the documentation

Requires Java 17+ and curl. Widoco is downloaded to `.cache/` on first run.

```
bash scripts/build-docs.sh
python3 -m http.server -d docs 8000   # then open http://localhost:8000
```

View the page through a local web server, not by opening `docs/index.html` directly:
from `file://` the browser blocks the dark-mode toggle script (CORS error).

Ontology metadata (title, authors, version, dates, license) comes from the Turtle file.
Abstract, introduction and description are maintained in `widoco/`.

On GitHub, every push to `main` rebuilds the page and deploys it to GitHub Pages.

## Author

Oliver Schulz — [Design Computation, RWTH Aachen University](https://dc.rwth-aachen.de/)
