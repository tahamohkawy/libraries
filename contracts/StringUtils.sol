pragma solidity ^0.4.18;

library StringUtils {

    function charAt(string a,uint index) public pure returns (string) {
         bytes memory _a = bytes(a);
         assert(_a.length > 0);
         assert (index <= _a.length-1);            

         bytes memory found = new bytes(1);
         found[0] = _a[index];
         
         return string(found);
    }
    

    function concat(string a, string b,string separator) public pure returns (string) {
        
        bytes memory _s = bytes(separator);
        assert(_s.length <= 1);
        
        bytes memory _a = bytes(a);
        bytes memory _b = bytes(b);
    
        bytes memory _all = new bytes(_a.length + _b.length + _s.length);
        
        uint i;
        uint j;
        
        for(i=0;i<_a.length;i++){
            _all[i] = _a[i];
            j++;
        }
        
        if (_s.length > 0){
            _all[j++] = _s[0];
        }
        
        for (i=0;i<_b.length;i++){
            _all[j++] = _b[i];
        }
        
        return string(_all);
    }

    function indexOf(string a, string b) public pure returns (int) {
        bytes memory _a = bytes(a);
        bytes memory _b = bytes(b);
        assert(_a.length > 0);
        assert(_b.length == 1);
        
        for(uint i=0;i<_a.length;i++){
            if (_a[i] == _b[0]) return int(i);
        }
        
        return -1;
    }

    function replace(string a,string b, string r) public pure returns (string) {
        bytes memory _a = bytes(a);
        assert(_a.length > 0);
        
        bytes memory _b = bytes(b);
        assert(_b.length == 1);
        
        bytes memory _r = bytes(r);
        assert(_r.length == 1);
        
        for(uint i=0;i<_a.length;i++){
            if(_a[i] == _b[0]){
                _a[i] = _r[0];
                break;
            }
        }
        
        return string(_a);
    }

    function replaceAll(string a,string b, string r) public pure returns (string) {
        bytes memory _a = bytes(a);
        assert(_a.length > 0);
        
        bytes memory _b = bytes(b);
        assert(_b.length == 1);
        
        bytes memory _r = bytes(r);
        assert(_r.length == 1);
        
        for(uint i=0;i<_a.length;i++){
            if(_a[i] == _b[0]){
                _a[i] = _r[0];
            }
        }
        
        return string(_a);
    }

    function split(string a,string s) public pure returns (string,string) {
        bytes memory _a = bytes(a);
        assert(_a.length > 0);
        
        bytes memory _s = bytes(s);
        assert(_s.length == 1);
        
        int index = indexOf(a,s);
        if(index == -1) return (a,"");
        
        bytes memory _1 = new bytes(uint(index));
        bytes memory _2 = new bytes(_a.length - uint(index));
        
        uint j;
        
        for(uint i=0;i<_a.length;i++){
            if(i < uint(index)){
                _1[i] = _a[i];
                continue;
            }
            if(i == uint(index)) continue;
            
            ++j;
            _2[j] = _a[i];
        }
        
        return (string(_1),string(_2));
    }
}