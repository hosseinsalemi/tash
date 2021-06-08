# :fire: ta.sh

Ta.sh is a **Bash framework** for run tasks and project scripts. Tash is an ancient word means fire.

## What is it?

Use one command for all tasks in all your projects.

use

```bash
app get
app install
app start
app deploy
```

instead of

```bash
git pull
npm install
npm start
rsync -r local/ remote
```

## Getting started

1. Download `ta.sh` file to root of your project.

2. Create a file to root of your project named `app.sh` and add below lines to it.

```bash
#!/bin/bash
source ta.sh
```

3. Add your scripts under the functions with two underscode prefix in `app.sh`. For example we add two methods named "hi" and "bye".

```bash
__hi() {
  echo "Hello World"
}

__bye() {
  echo "Goodbye"
}
```

4. To access methods as a bash commands you need to source `app.sh` to every terminal session. Open terminal in root of the project and run below command.

```bash
. app.sh
```

> You can install `ta.sh` globally instead.

5. Now run blow command in terminal.

```bash
app hi
```

You should see "Hello World"

## Install globally (Optional)

You can install globally by copy below code to `~/.bashrc` or `~/.zshrc` file.

```bash
app() {
  source app.sh
  __run "$@"
}
```

Now you don't need to source ‍`app.sh` on every terminal.

## Documentation

### Logger

If you want print some text or log message to the console, you can call the \_\_print methods with arguments.

```bash
__print "This text is black."
__print red "This text is red."
```

Supported colors is `red, green, yellow, blue`.

### Add help

You can add help in `__help` function in your `app.sh`. If you run `app help` or `app` command you should see that.

```bash
__help() {
  echo "This is a help"
}
```

### Add logo

If you add a file inside of `ta.sh` named `.logo` then the content of that printed to each command response. You can write your team name, app name, etc. by ascci banner.

### Source .env file

If you have `.env` file in your project you can export all of them by below command.

```bash
__source_env_file ENV_FILE_PATH
```

### Check function exists

return true if a function is exists in `app.sh`.

```bash
if __function_exists FUNCTION_NAME; then
  # some code
fi
```

### Call function if exists

You can safty call functions defined in `app.sh` by below command.

```bash
__call_function FUNCTION_NAME
```

### Subscribers

By built-in subscribers you can run your scripts pre or post `app.sh` commands. You can add below methods to your `app.sh` file.

```bash
__pre_app_subscriber() {
  echo "This method called before any app commands."
}

__post_app_subscriber() {
  echo "This method called after any app commands."
}
```
