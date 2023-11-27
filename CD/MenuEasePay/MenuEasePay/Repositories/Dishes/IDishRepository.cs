using MenuEasePay.Models;

namespace MenuEasePay.Repositories.Dishes;

public interface IDishRepository
{
    List<Dish> GetDishes();
    Dish GetDishById(int id);
    void AddDish(Dish dish);
    void UpdateDish(Dish dish);
    void DeleteDish(int id);
}