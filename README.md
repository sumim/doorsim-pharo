# Playing with Simulating Door Behavior and Extensions

This playful task is designed to introduce you to the basics of object-oriented programming. You'll be creating objects for a "Door" and its "Knob", and then simulating how they interact. As a fun twist, you'll also add quirky features to the door, such as a "Stopper" and a "Closer", using inheritance, mixins, and traits. Dive in and see how you can use these object-oriented concepts in a light-hearted way!

The code provided as an example here is written in [Pharo Smalltalk](https://pharo.org/), but you should be able to easily replicate the same specifications in any modern object-oriented programming language.

**Basic Behavior of the Door**:
- The "Door" maintains a state of "closed" and possesses one "Knob".
- The "Knob" is attached to its corresponding "Door" and can "be latched" (through a latch or similar mechanism to the door frame). Note: You don't need to add details about the "latch" or "door frame".
- The door's state can be changed by "pushing" or "pulling", and the knob's state can be changed by "turning" or "unturning".
- The knob (and its corresponding latch, implicitly) can only secure the door to the frame when the door is closed.
- Turn the door's knob (to release) → Push the door (and it opens) → Pull the door (and it closes, automatically latching).
- If you push a closed door without turning the knob, it won't open (the push action will be ignored).

**Extra Challenges**:
1. **Installing a Door Closer**:
- Demonstrate parallel processing skills using threads or similar features of your language.
- When the door is opened, it automatically closes after a predetermined time.
- The time it takes for the door to close can be adjusted, and changes are immediately reflected.
- If the door is pushed while it's automatically closing or if the closing time is changed, the remaining time to close is reset.

2. **Installing a Door Stopper**:
- Demonstrate class expansion skills that modify the behavior of the base class.
- When the door is open and the stopper is set, pulling the door won't close it.
- Release the door stopper, and pulling the door will close it.
- If the door is pushed while the stopper is set, the stopper is automatically released.

3. **Door with Both a Closer and a Stopper**:
- Demonstrate multiple inheritance skills.
- When the stopper is active, the closer's movement is suppressed.

---

悪名高い「わんにゃん」や「銀行振込」よりは複雑ですがこれらと基本的には変わらない、ク○の役にも立たないコードをオブジェクト指向言語の典型的機能を駆使して書かせるだけのお題なので、そういうことが嫌いな人には向きませんので悪しからず。

お題：次のように振る舞う「ドア」とそれに据え付けられた「ノブ」をできるだけ簡潔なコードで表現して操作（シミュレート）せよ

▼基本的なドアの振る舞い
- 「ドア」は「閉じている」という状態を保持し、「ノブ」を一つ有している
- 「ノブ」はそれが属する「ドア」と、そのドアを（ノブに連動するラッチ等を介してドア枠などに）「固定している」という状態を持つ（循環参照。なお「ラッチ」や「ドア枠」等は追加しなくてよい）
- ドアは「押す」「引く」、ノブは「回す」「戻す」ことで状態を変化させられる（ミュータブル）
- ドアが閉じているときしかノブ（に連動するラッチ）はドアを枠に固定できない
- ドアのノブを回す（固定解除）→ドアを押す（ドアが開く）→ドアを引く（ドアが閉まり、自動的に固定される）
- ドアは閉まった状態でノブを回さずに押しても開かない（無視される）

```
  door is a Door...
  door knob turn. door canBeOpen. => true
  door knob unturn. door canBeOpen. => false
  door push; isOpen. => false
  door knob turn. door push; isOpen. => true
  door pull; isClose. => true
  door canBeOpen. => false
```

●以上のように振る舞うドアに対して、以下の拡張をする際にどの程度コードの追加を必要とするかを見る

▼ドアへのドアクローザー設置
- スレッド等による並列処理を試す
- ドアを開くとあらかじめ決められた時間をおいて自動的にドアが閉まる
- ドアが閉まるまでの時間は自由に変えられ、変更は直ちに反映される
- ドアが自動で閉まる途中でドアを押すか閉まるまでの時間を変更すると、閉まるまでの残り時間はリセットされる

```
door is a DoorWithCloser with 0.3 seconds delay...
door knob turn. door push; isOpen. => true
0.1 second after, door isOpen. => true
0.4 seconds after, door isClose. => true
door knob turn. door push; delaySec: 0.6; isOpen. => true
0.4 second after, door isClose. => false
0.7 seconds after, door isClose. => true"
```

▼ドアへのドアストッパー設置
- 振る舞いを変更する拡張を試す
- ドアが開いた状態でストッパー設置→ドアを引いても閉まらない（無視される）
- ドアストッパー解除→ドアを引くと閉まる
- ドアストッパー設置状態でドアを押すとストッパー自動解除

```
door is a DoorWithStopper...
door knob turn. door push; isOpen. => true
door beStopperedOn; pull; isClose. => false
door beStopperedOff; pull; isClose. => true
door knob turn. door push; isOpen. => true
door beStopperedOn; pull; isClose. => false
door push; pull; isClose. => true
```

▼ドアクローザー、ドアストッパーを同時に設置したドア
- 多重継承を試す
- ストッパーが効いてるときはクローザーの動きは抑制される

```
door is a DoorWithStopperCloser with 0.3 seconds delay...
door knob turn. door push; isOpen. => true
door beStopperedOn. then 0.4 seconds after, door isOpen. => true
door beStopperedOff. then 0.4 seconds after, door isClose. => true
door knob turn. door push; isOpen. => true
door beStopperedOn. then 0.4 seconds after, door isOpen. => true
door push. then 0.4 seconds after, door isClose. => true"
```

●他の言語での実装例
- Ruby http://ideone.com/rJwQfi
- Python http://ideone.com/sKJtKv
- Scala http://ideone.com/O2yc7D
- Go http://ideone.com/qdyhyC
