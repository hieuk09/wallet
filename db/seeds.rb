puts "Create default category..."
Category.where(name: Category::TRANSFER, category_type: Category::INCOME).first_or_create
Category.where(name: Category::TRANSFER, category_type: Category::EXPENSE).first_or_create
