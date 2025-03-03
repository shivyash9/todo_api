module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: [:destroy, :mark_completed, :update_status, :update]

      # GET /api/v1/tasks
      def index
        tasks = Task.all
        render json: tasks
      end

      # POST /api/v1/tasks
      def create
        task = Task.new(task_params)
        if task.save
          render json: task, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/tasks/:id
      def destroy
        @task.destroy
        head :no_content
      end

      # PATCH /api/v1/tasks/:id/mark_completed
      def mark_completed
        if @task.update(completed: true, status: :completed)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/tasks/:id/update_status
      def update_status
        if @task.update(status: params[:status])
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/tasks/:id
      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      private

      def set_task
        @task = Task.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Task not found" }, status: :not_found
      end

      def task_params
        params.require(:task).permit(:title, :description, :assigned_to, :status)
      end
    end
  end
end
