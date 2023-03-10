int bar(int a);
int foo();

int main(int argc, char const *argv[]){
    
	return foo();
	
}

int bar(int a){ return a; }

int foo(){
    	int (*fp)(int) = bar;
	int res = fp(4);
	return res;
}
