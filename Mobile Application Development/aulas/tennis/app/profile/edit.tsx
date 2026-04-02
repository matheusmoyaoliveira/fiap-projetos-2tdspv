import { Link } from 'expo-router'
import React from 'react'
import { Text, View } from 'react-native'

const EditScreen = () => {
  return (
    <View>
      <Text>EditScreen</Text>
      <Link dismissTo href={"/profile"}>Voltar</Link>
    </View>
  )
}

export default EditScreen