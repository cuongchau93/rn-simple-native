/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useState, useEffect, useCallback, useMemo} from 'react';
import {
  StyleSheet,
  View,
  Text,
  Button,
  NativeModules,
  Image,
  requireNativeComponent,
} from 'react-native';

const BulbView = requireNativeComponent('BulbView');
const CRNImageView = requireNativeComponent('CRNImageView');

export default () => {
  const [isOn, setIsOn] = useState(false);

  const turnOn = useCallback(() => {
    NativeModules.Bulb.turnOn();
    updateStatus();
  }, []);

  const turnOff = useCallback(() => {
    NativeModules.Bulb.turnOff();
    updateStatus();
  }, []);

  const updateStatus = () => {
    NativeModules.Bulb.getStatus((error, status) => {
      setIsOn(status);
    });
  };

  // const onClick = event => {
  //   setIsOn(event.nativeEvent.isOn);
  // };

  return (
    <View style={styles.container}>
      <View style={styles.top}>
        <Text style={styles.welcome}>Welcome to Light App!!</Text>
        {useMemo(
          () => (
            <Text> Bulb is {isOn ? 'ON' : 'OFF'}</Text>
          ),
          [isOn],
        )}
        <Button style={styles.button} onPress={turnOn} title="Turn ON " />
        <Button style={styles.button} onPress={turnOff} title="Turn OFF" />
      </View>
      {/* <BulbView style={styles.bulb} isOn={isOn} onStatusChanged={onClick} /> */}
      <View style={styles.bottom}>
        {/* <Image style={styles.tinyLogo} source={require('./ic_launcher.png')} /> */}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
  },
  top: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  bottom: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  button: {
    backgroundColor: 'blue',
  },
  bulb: {
    flex: 1,
    textAlign: 'center',
    justifyContent: 'center',
    alignItems: 'center',
  },
});
