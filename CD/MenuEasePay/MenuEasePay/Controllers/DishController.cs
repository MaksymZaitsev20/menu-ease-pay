using MenuEasePay.Repositories.Dish;
using Microsoft.AspNetCore.Mvc;

namespace MenuEasePay.Controllers;

public class DishController : ControllerBase
{
    private readonly DishRepository _dishRepository;

    public DishController(DishRepository dishRepository)
    {
        _dishRepository = dishRepository;
    }

    [HttpGet]
    public IActionResult GetDishes()
    {
        var dishes = _dishRepository.GetDishes();
        return Ok(dishes);
    }
}