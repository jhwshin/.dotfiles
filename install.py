#!/usr/bin/env python


from pathlib import Path
import os
import subprocess
import shlex
import sys
from repos import *


# cli select device
def selected_device():

    try:
        device = sys.argv[1]
        if device == "desktop" or device == "laptop":
            return device
        else:
            raise Exception()
    except Exception as e:
        print("Please choose 'desktop' or 'laptop'.")
        exit()

# run bash command on python
def run_bash_cmd(cmd):

    # start subprocess
    process = subprocess.Popen(
        shlex.split(cmd),
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        encoding='utf8'
    )

    # print output of process realtime
    while True:
        output = process.stdout.readline().rstrip()
        if output == "" and process.poll() is not None:
            break
        print(output)

    exit_codes = process.poll()
    return exit_codes

# run stow
def run_stow(src, dst):

    print(f"-- Running stow for {src}...\n")

    # stow only dirs and skip hidden dirs
    dirs_to_stow = [d for d in src.iterdir() if d.is_dir() and not d.stem.startswith(".")]

    # return code for each stow dir
    stow_exit_codes = {}

    # commence stow
    for d in dirs_to_stow:
        return_code = run_bash_cmd(f"stow -v {d.stem} --dir {src} --target {dst}")
        stow_exit_codes[d.stem] = return_code
    print()

    fail = False
    for stow_dir, return_code in dict(sorted(stow_exit_codes.items())).items():
        if return_code == 0:
            print("[O]", stow_dir)
        else:
            print("[X]", stow_dir)
    print()

    if fail:
        print("-- !! stow FAILED.\n")
    else:
        print("-- All stow SUCCESSFULLY linked!\n")

# git clone repos
def clone_repos(repos):
    print("-- Cloing repos...\n")

    for repo in repos:
        return_code = run_bash_cmd(f"git clone {repo['url']} {repo['path']}")
    print()

# main run script
if __name__ == "__main__":

    print("\n>> Installing .dotfiles...\n")

    device = selected_device()
    run_stow(DOTFILES_ROOT_PATH / device, HOME_PATH)
    run_stow(DOTFILES_ROOT_PATH / "common", HOME_PATH)
    clone_repos(REPOS)

    print("<< .dotfiles installation complete!\n")
