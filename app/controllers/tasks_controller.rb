class TasksController < ApplicationController
    
    def new
       @task = Task.new()
    end
    
    def create
        @task = Task.new(task_params)
        if @task.save
            flash[:notice] = "משימה נוספה בהצלחה!"
            redirect_to task_path(@task)
        else
            render 'new'
        end
    end
    
    def show
       @task = Task.find(params[:id])
    end
    
    def index
       
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            flash[:notice] = "מטלה נערכה בהצלחה!"
            redirect_to task_path(@task)
        else
            render 'edit'
        end
    end
    
    private
    def task_params
        params.require(:task).permit(:name, :description)
    end
    
end
