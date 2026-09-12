# sp_odin
## Setup
1. Install [ols](https://github.com/DanielGavin/ols)
2. Add `sp` to your `ols.json` config file as follows:
    ```json
    "collections": [
        { "name": "sp", "path": "path/to/sp_odin/sp" }
    ],
    ```
## How To Use
`sp` functions similarly to Odin's built-in collections.

Once you've configured [ols](https://github.com/DanielGavin/ols) to recognise it, you simply need to import the collection by name and specify the desired package you want to use within it:
```odin
import "sp:music"

main :: proc() {
    my_note := music.Note__new__random_major_root()
}
```

Then pass the collection name to the build command as follows:
```bash
odin run . -collection:sp=path/to/sp_odin/sp
```
