## Classes

To be viewed using [Mermaid](https://mermaid-js.github.io/mermaid-live-editor/)

```mermaid
classDiagram
	class Key
	Key : +String id
	Key : +DateTime created_on
	Key : +DateTime validity_started_on
	Key : +int refresh_count

	Key : +refresh()

	class KeyBase
	KeyBase: +Hash unblocked_keys
	KeyBase: +Hash blocked_keys

	KeyBase: +generateKey()
	KeyBase: +getAvailableKey()
	KeyBase: +unblockKey(id)
	KeyBase: +deleteKey(id)
	KeyBase: +keepAlive(id)
```

To view this better in github.com install [Mermaid diagrams](https://chrome.google.com/webstore/detail/mermaid-diagrams/phfcghedmopjadpojhmmaffjmfiakfil?hl=en) extension

### Key

This class contains the details of every single Key generated.

### KeyBase

This class manages all the keys and has the list of blocked and unblocked keys
