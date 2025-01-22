FriCAS TMUX
###########

:date: 2025-01-22 17:16
:tags: fricas, tmux
:category: FRICAS
:slug: FriCAS TMUX
:author: kfp
:summary: FriCAS TMUX (script)

This little script `fricas.tmux.sh` starts a tmux session with 
**FriCAS**, **Gnuplot**, **Emacs** and **Lynx**.

.. code-block:: shell

        #!/bin/bash
        
        WORKDIR=/tmp
        FRICAS_CMD="rlwrap fricas -nosman"
        EDITOR_CMD="emacs -nw"
        GRAPHICS_CMD="gnuplot"
        PAGER_CMD="lynx"
        
        tmux select-layout even-vertical
        tmux select-layout even-horizontal 
        
        tmux new-session -d -s FriCAS -n Main
        tmux send -t FriCAS:Main "cd $WORKDIR" Enter
        tmux send -t FriCAS:Main "$FRICAS_CMD" Enter
        
        
        tmux split-window -h
        tmux send "$GRAPHICS_CMD" Enter
        
        
        tmux split-window  -v -t 1
        tmux send  "$EDITOR_CMD" Enter
        
        
        tmux split-window  -v -t 3
        tmux send  "$PAGER_CMD" Enter
        
        
        tmux attach -t FriCAS:Main
        
        # show pane numbers: C-a q
        # FRICAS: )system tmux lsp , send -t 1 ... 
        # )system tmux kill-server ---> ok        

  
One may send commands by using the `)system` command:     
        
.. image:: content/fricas-tmux-1.jpg



.. image:: content/fricas-tmux-2.jpg



.. image:: content/fricas-tmux-3.jpg




        
