import { PersistenceV2 } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DisplayPrefs } from './DisplayPrefs';

const DOMAIN = 0xFF01;

// connect() must run after UI init: call from a member initializer, not module top-level.
export function connectDisplayPrefs(): DisplayPrefs {
  return PersistenceV2.connect(DisplayPrefs, () => new DisplayPrefs())!;
}

// remove() disconnects the handle, so callers must re-assign it to persist again.
export function resetDisplayPrefs(): DisplayPrefs {
  PersistenceV2.remove(DisplayPrefs);
  return PersistenceV2.connect(DisplayPrefs, () => new DisplayPrefs())!;
}

export function registerPersistErrorLogging(): void {
  PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
    hilog.error(
      DOMAIN,
      'DisplayPrefs',
      'PersistenceV2 error key: %{public}s, reason: %{public}s, message: %{public}s',
      key,
      reason,
      msg
    );
  });
}
