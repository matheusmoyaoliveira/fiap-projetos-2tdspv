import { Link } from 'expo-router'
import React from 'react'
import { Text, View } from 'react-native'

const ProfileScreen = () => {
  return (
    <View>
      <Text>ProfileScreen</Text>
      <Link push href={"/profile/edit"}>Editar</Link>
    </View>
  )
}

export default ProfileScreen