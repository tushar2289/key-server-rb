## Classes

To be viewed using (Mermaid)[https://mermaid-js.github.io/mermaid-live-editor/]

```mermaid
classDiagram
	class Key
	Key : +String id
	Key : +DateTime created_on
	Key : +DateTime validity_started_on
	Key : +int refresh_count

	Key : +toggleBlocking()
	Key : +refresh()

	class KeyBase
	KeyBase: +Hash unblocked_keys
	KeyBase: +Hash blocked_keys
	KeyBase: +Hash expired_keys

	KeyBase: +generate()
	KeyBase: +blockKey(key)
	KeyBase: +unblockKey(key)
	KeyBase: +expireKey(key)
	KeyBase: +deleteKey(key)
	KeyBase: +getAnUnblockedKey(key)
```

To view this better in github.com install [Mermaid diagrams](Mermaid%20diagrams%20%E2%87%92%20https://chrome.google.com/webstore/detail/mermaid-diagrams/phfcghedmopjadpojhmmaffjmfiakfil?hl=en) extension on Chrome

### Key

This class contains the details of every single Key generated.

### KeyBase

This class manages all the keys and has the list of blocked, unblocked and expired keys
