module LessonsHelper
    def is_finished(category)
        Lesson.find_by(category_id: category.id, user_id: current_user.id)
    end
end
