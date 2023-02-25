import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

const userCollection = "users";
const productionCollection = "products";
const cartCollection = "cart";
const chatsCollection = "chats";
const messageCollection = "messages";

const ordersCollection = "orders";
