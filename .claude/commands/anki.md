$ARGUMENTS

The text above describes the concepts from our discussion that the user wants to memorize as Anki cards.

Create Anki cards following these rules:

## Cards should be as atomic as possible

Cards should be short and refer to as little information as possible.

Bad:
```
Q: What properties and values does the final ACK in a TCP three-way handshake have?
A: Flags: ACK\nSequence Number: client's ISN + 1\nAcknowledgement Number: server's ISN + 1
```

Good:
```
Q: the acknowledgement field of a TCP ACK packet should be set to
A: the server's ISN + 1
Q: the sequence number field of a TCP ACK packet should be set to
A: the client's ISN + 1
Q: the flags field of a TCP ACK packet should be set to
A: ACK
```

## Vocabulary words with complex definitions should use cloze cards instead of basic

Bad:
```
Q: What is a "connected route" in the context of the Linux routing table?
A: An automatically added route representing the local subnet reachable directly via an interface
```

Good:
```
Cloze: What is a "connected route" in the context of the Linux routing table?\n\nAn automatically added route representing {{c1::the local subnet}} reachable directly via {{c1::an interface}}
Q: Are "connected routes" in linux added automatically or manually?
A: automatically
```

## Write two-way questions

When possible, ask questions in both directions.

Example — in addition to the atomic cards above, also create:
```
Q: what field of a TCP ACK packet should be set to the server's ISN + 1?
A: the acknowledgement field
Q: what field of a TCP ACK packet should be set to the client's ISN + 1?
A: the sequence number field
Q: what field should be set to ACK in a TCP ACK packet?
A: the flags field
```

---

Generate the cards and write them to two files in /tmp/:

**`/tmp/anki-basic.txt`** — Basic note type, tab-separated:
```
#separator:tab
#html:false
#notetype:Basic
#deck:Inbox
Front[tab]Back
...
```

**`/tmp/anki-cloze.txt`** — Cloze note type, tab-separated:
```
#separator:tab
#html:false
#notetype:Cloze
#deck:Inbox
Text[tab]Extra
...
```

Only write the cloze file if there are cloze cards to add. Only write the basic file if there are basic cards to add. The "Extra" column for cloze cards should be left empty (just a trailing tab or omitted).

After writing the files, print all the cards you created so the user can review them.
