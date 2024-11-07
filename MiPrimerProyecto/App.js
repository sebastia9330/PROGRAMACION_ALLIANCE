import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>Chao Dilza</Text>
      <Text style={styles.text}>Estas muy Bonita</Text>
      <StatusBar style="auto" />
    </View>
  );
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
    text: {
      margin: 40,
      fontSize: 45,
      color: 'blue',
      fontWeight: 'bold',
      borderWidth: 2,
      borderColor: 'lightgray',
      borderRadius: 10,
      backgroundColor: '#000',
      padding: 35,
    }
});
