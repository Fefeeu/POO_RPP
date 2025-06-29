import { Routes, Route } from "react-router-dom";
import { HomePage } from "../pages/Home";
import { PackPage } from "../pages/Pack";
import { LoginPage } from "../pages/Login";
import { SignupPage } from "../pages/Signup";
import { CreateSheetPage } from "../pages/CreateSheet";
import { AboutUsPage } from "../pages/AboutUs";
import { UserPage } from "../pages/User";
import { ReadSheetPage } from "../pages/ReadSheet";

export function AppRouter(){
    return (
        <Routes>
            <Route path="/" element={<HomePage/>}/>
            <Route path="/criar-ficha" element={<CreateSheetPage/>}/>
            <Route path="/sobre-nos" element={<AboutUsPage/>}/>
            <Route path="/pack" element={<PackPage/>}/>
            <Route path="/login" element={<LoginPage/>}/>
            <Route path="/signup" element={<SignupPage/>}/>
            <Route path="/user" element={<UserPage/>}/>
            <Route path="/sheet/:id" element={<ReadSheetPage/>}/>
        </Routes>
    );
}