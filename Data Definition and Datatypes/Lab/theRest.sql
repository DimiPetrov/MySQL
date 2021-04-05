ALTER TABLE `employees`
  ADD `middle_name` VARCHAR(50) NOT NULL DEFAULT '';
  
  
  ALTER TABLE `products` 
  ADD CONSTRAINT fk_category_id
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
  ALTER TABLE `employees`
  MODIFY `middle_name` VARCHAR(100) NOT NULL DEFAULT '';
