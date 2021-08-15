import 'package:grinder/grinder.dart';

/*
apparently line
    runOptions: RunOptions(runInShell: true),
is required to work on Windows so i'll keep it
*/

void main(args) => grind(args);

@Task('clean build model')
void clean() {
  try {
    log('cleaning...');
    run(
      'fvm flutter pub run build_runner clean',
      quiet: isQuiet(),
      runOptions: RunOptions(runInShell: true),
    );
  } catch (error) {
    handleError(error);
  }
}

@Task('build model')
void build() {
  try {
    log('building...');

    run(
      'fvm flutter pub run build_runner build --delete-conflicting-outputs --no-fail-on-severe --verbose > build_log.txt',
      quiet: isQuiet(),
      runOptions: RunOptions(runInShell: true),
    );
  } catch (error) {
    handleError(error);
  }
}

@Task('watch to rebuild model')
void watch() {
  try {
    run(
      'fvm flutter pub run build_runner watch --delete-conflicting-outputs --no-fail-on-severe --verbose',
      quiet: isQuiet(),
      runOptions: RunOptions(runInShell: true),
    );
  } catch (error) {
    handleError(error);
  }
}

@Task('completely rebuild model')
@Depends(clean, build)
void rebuild() {
  log('rebuilding...');
}

@Task('regenerate l10n (useful in older projects which cannot do that on their own)')
void intl() {
  log('generating l10n...');
  run(
    'flutter --no-color pub global run intl_utils:generate',
    quiet: isQuiet(),
    runOptions: RunOptions(runInShell: true),
  );
}

bool isQuiet() {
  TaskArgs args = context.invocation.arguments;
  return !args.getFlag('verbose');
}

void handleError(dynamic error) {
  if (error is ProcessException && error.exitCode == -1073741819) {
    // do nothing no idea why this happens only with build_runner
  } else {
    throw error;
  }
}
