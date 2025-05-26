# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

data "gitlab_project" "this" {
  id = var.gitlab_project_id
}
