require 'rails_helper'

RSpec.describe "Tasks API", type: :request do
  before do
    @task1 = Task.create!(title: "Task 1", description: "Description 1", assigned_to: "User1", status: "pending")
    @task2 = Task.create!(title: "Task 2", description: "Description 2", assigned_to: "User2", status: "pending")
    @task3 = Task.create!(title: "Task 3", description: "Description 3", assigned_to: "User3", status: "pending")
  end

  describe "GET /api/v1/tasks" do
    it "returns all tasks" do
      get "/api/v1/tasks"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /api/v1/tasks" do
    let(:valid_attributes) { { task: { title: "New Task", description: "Test task", assigned_to: "User", status: "pending" } } }

    it "creates a new task" do
      post "/api/v1/tasks", params: valid_attributes
      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)["title"]).to eq("New Task")
    end
  end

  describe "PATCH /api/v1/tasks/:id" do
    let(:update_attributes) { { task: { title: "Updated Task" } } }

    it "updates the task" do
      patch "/api/v1/tasks/#{@task1.id}", params: update_attributes
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["title"]).to eq("Updated Task")
    end
  end

  describe "PATCH /api/v1/tasks/:id/mark_completed" do
    it "marks the task as completed" do
      patch "/api/v1/tasks/#{@task1.id}/mark_completed"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["status"]).to eq("completed")
    end
  end

  describe "DELETE /api/v1/tasks/:id" do
    it "deletes the task" do
      delete "/api/v1/tasks/#{@task1.id}"
      expect(response).to have_http_status(204)
    end
  end
end
