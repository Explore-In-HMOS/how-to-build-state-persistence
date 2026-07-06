import { Type } from '@kit.ArkUI';

export interface AccentOption {
  name: string;
  color: string;
}

export const accentPalette: AccentOption[] = [
  { name: 'Pulse Teal', color: '#26C6DA' },
  { name: 'Sunrise Amber', color: '#FFB300' },
  { name: 'Sprint Magenta', color: '#EC407A' },
  { name: 'Trail Lime', color: '#9CCC65' }
];

export const unitPresets: string[] = ['km', 'mi'];

export const goalPresets: Int16Array = new Int16Array([3000, 5000, 8000, 10000]);

export const watchFacePresets: string[] = ['Minimal', 'Activity Rings', 'Big Numbers', 'Track'];

@ObservedV2
export class WatchFace {
  @Trace label: string = watchFacePresets[0];
}

@ObservedV2
export class DisplayPrefs {
  @Trace accentIndex: number = 0;
  @Trace unitIndex: number = 0;
  @Type(WatchFace)
  @Trace face: WatchFace = new WatchFace();
}
