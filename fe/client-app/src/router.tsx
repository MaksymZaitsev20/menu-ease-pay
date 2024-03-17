import { createBrowserRouter } from "react-router-dom";

import Layout from "./components/Layout/Layout.tsx";
import Menu from "./pages/Menu/Menu.tsx";
import Home from "./pages/Home/Home.tsx";
import Payment from "./pages/Payment/Payment.tsx";

const router = createBrowserRouter([
  {
    element: <Layout />,
    errorElement: <div>404 Not Found</div>, // TODO: replace with a 404 page
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
