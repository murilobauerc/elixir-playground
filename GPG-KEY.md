ISSUE WITH GPG SOLVED: unset and set again the user.signinkey and commit.gpgsign as below:

✗ git config --local --unset user.signingkey
✗ git config --local --unset commit.gpgsign

✗ gpg2 -K --keyid-format SHORT
--- information ---

--------------------------------------------
git config --global user.signingkey 123456
git config --global commit.gpgsign true

➜  elixir-playground git:(fix/gpg-key) ✗ git commit -m "gpg"
[fix/gpg-key 3cc7c25] gpg
 1 file changed, 1 insertion(+), 1 deletion(-)