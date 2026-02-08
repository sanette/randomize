open Bogue
module W = Widget
module L = Layout

let randomize () =
  (* The widgets *)
  let label_min = W.label "Min:" in
  let filter = Text_input.uint_filter in
  let ask_min = W.text_input ~prompt:"enter min" ~filter ~text:"0" () in
  let label_max = W.label "Max:" in
  let ask_max = W.text_input ~prompt:"enter max" ~filter ~text:"100" () in
  let rnd_button = W.button ~border_radius:10 "RANDOMIZE" in
  let result = W.label ~size:48 "            " in

  (* The logic *)
  let on_press button label _ev =
    let start, fps = Time.adaptive_fps 60 in
    let min = int_of_string (Text_input.text (W.get_text_input ask_min)) in
    let max = int_of_string (Text_input.text (W.get_text_input ask_max)) in
    if min <= max then
      let () = start () in
      let b = W.get_button button in
      while Button.is_pressed b do
        let i = min + Random.int (1 + max - min) in
        Label.set (W.get_label label) (string_of_int i);
        W.update label;
        fps ()
      done
  in

  let c =
    W.connect ~priority:W.Join rnd_button result on_press Trigger.buttons_down
  in

  (* The layout *)
  let minmax =
    L.flat_of_w ~align:Draw.Center
      ~background:(L.color_bg Draw.(transp RGB.grey))
      [ label_min; ask_min; label_max; ask_max ]
  in
  let rl = L.resident ~background:(L.color_bg Draw.(transp RGB.white)) result in
  let bl = L.resident rnd_button in
  let layout = L.tower ~sep:10 ~align:Draw.Center [ minmax; rl; bl ] in

  (* Some animation for fun *)
  L.slide_in ~from:Avar.Random bl ~dst:layout;
  L.slide_in ~from:Avar.Random rl ~dst:layout;

  (* Assemble board and run *)
  let board = Main.of_layout ~connections:[ c ] layout in
  Random.self_init ();
  Main.run board

let () = randomize ()
