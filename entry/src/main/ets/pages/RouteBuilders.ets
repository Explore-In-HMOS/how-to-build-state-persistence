import { Home } from './Home';
import { StateBasics } from './StateBasics';
import { Workout } from './Workout';
import { Settings } from './Settings';
import { Display } from './Display';
import { Insights } from './Insights';

@Builder
export function HomeRouteBuilder() {
  NavDestination() {
    Home();
  }
  .hideTitleBar(true)
}

@Builder
export function BasicsRouteBuilder() {
  NavDestination() {
    StateBasics();
  }
  .hideTitleBar(true)
}

@Builder
export function WorkoutRouteBuilder() {
  NavDestination() {
    Workout();
  }
  .hideTitleBar(true)
}

@Builder
export function SettingsRouteBuilder() {
  NavDestination() {
    Settings();
  }
  .hideTitleBar(true)
}

@Builder
export function DisplayRouteBuilder() {
  NavDestination() {
    Display();
  }
  .hideTitleBar(true)
}

@Builder
export function InsightsRouteBuilder() {
  NavDestination() {
    Insights();
  }
  .hideTitleBar(true)
}
