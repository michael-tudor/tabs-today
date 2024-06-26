class User < ApplicationRecord
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :marks, dependent: :destroy
  has_many :workspaces, dependent: :destroy

  after_create :create_workspace_by_default

  def get_default_workspace
    if workspaces.any?
      workspaces.first
    else
      create_workspace_by_default
    end
  end

  private

  def create_workspace_by_default
    Workspace.create(name: 'My Workspace', user_id: id, positions_and_sizes: '{}')
  end
end
