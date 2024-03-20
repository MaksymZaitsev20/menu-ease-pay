import { createBrowserRouter } from "react-router-dom";

import Layout from "./components/Layout/Layout.tsx";
import Menu from "./pages/Menu/Menu.tsx";
import Home from "./pages/Home/Home.tsx";
import Payment from "./pages/Payment/Payment.tsx";
import NotFound from "./pages/NotFound/NotFound.tsx";

const router = createBrowserRouter([
  {
    element: <Layout />,
    errorElement: <NotFound />,
    children: [
      {
        path: "/",
        element: <Home />,
      },
      {
        path: "/menu",
        element: <Menu />,
      },
      {
        path: "/payment",
        element: <Payment />,
      },
    ],
  },
]);

export default router;
