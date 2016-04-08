# Custom Git Commands

fap()
{
	branch=${1:="dev"}
	git fetch && git pull origin $branch
}
