require_relative '../test_helper'
class UserEditsRobotTest < FeatureTest

  def test_user_can_edit_a_robot
    create_robots(2)
    visit '/robots'
    assert page.has_content?("Robot0")
    within(".robot_1") do
      click_link_or_button("Edit")
    end
    assert_equal '/robots/1/edit', current_path

    fill_in "robot[name]", with: "Robot Man"
    fill_in "robot[city]", with: "Robot City"
    fill_in "robot[state]", with: "Robot State"
    fill_in "robot[birthdate]", with: "Robot Bday"
    fill_in "robot[datehired]", with: "Robot Dhired"
    fill_in "robot[department]", with: "Robot Department"
    click_link_or_button("edit")

    assert_equal '/robots/1', current_path
    assert page.has_content?("Robot Man")
  end
end
