echo " Starting DevOps Workflow Automation..."
COMPILE_CMD=${COMPILE_CMD:-"make build"}
TEST_CMD=${TEST_CMD:-"make test"}
DEPLOY_CMD=${DEPLOY_CMD:-"./deploy.sh"}
build() {
  echo "[Build] Compiling source code using: $COMPILE_CMD"
  eval "$COMPILE_CMD"
  if [ $? -eq 0 ]; then
    echo "[Build] Build successful!"
  else
    echo "[Build] Build failed!"
    exit 1
  fi
}
test() {
  echo "[Test] Running tests using: $TEST_CMD"
  eval "$TEST_CMD"
  if [ $? -eq 0 ]; then
    echo "[Test] All tests passed!"
  else
    echo "[Test] Tests failed!"
    exit 1
  fi
}
deploy() {
  echo "[Deploy] Deploying application using: $DEPLOY_CMD"
  eval "$DEPLOY_CMD"
  if [ $? -eq 0 ]; then
    echo "[Deploy] Deployment successful!"
  else
    echo "[Deploy] Deployment failed!"
    exit 1
  fi
}
build
test
deploy

echo " DevOps Workflow Completed Successfully!"
