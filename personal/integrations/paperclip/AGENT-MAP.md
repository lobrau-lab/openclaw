# Agent Mapping (Docx to Paperclip)

The 45 predefined agents from `/Desktop/#TheStructuralSystems` are mapped here once imported.

| Docx File | Paperclip Agent ID | Role / Notes |
| :--- | :--- | :--- |
| *To be populated by the import script* | | |

## Import Process

The agents are parsed from `.docx` files located at `/Desktop/#TheStructuralSystems`.
Since the files are external to this repository, run the import script to parse the docx files (extracting name, role, responsibilities, tools, model, budget, and heartbeat schedule) and create the org chart via Paperclip's local API.

*(See `scripts/import_agents.sh` for the automation)*
