%class LabeledSymbol, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LabeledSymbol(size_t full_key)
%LabeledSymbol(LabeledSymbol key)
%LabeledSymbol(unsigned char valType, unsigned char label, size_t j)
%
%-------Methods-------
%chr() : returns unsigned char
%index() : returns size_t
%key() : returns size_t
%label() : returns unsigned char
%lower() : returns gtsam::LabeledSymbol
%print(string s) : returns void
%upper() : returns gtsam::LabeledSymbol
%
classdef LabeledSymbol < handle
  properties
    ptr_gtsamLabeledSymbol = 0
  end
  methods
    function obj = LabeledSymbol(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(807, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(808, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.LabeledSymbol')
        my_ptr = gtsam_wrapper(809, varargin{1});
      elseif nargin == 3 && isa(varargin{1},'char') && isa(varargin{2},'char') && isa(varargin{3},'numeric')
        my_ptr = gtsam_wrapper(810, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.LabeledSymbol constructor');
      end
      obj.ptr_gtsamLabeledSymbol = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(811, obj.ptr_gtsamLabeledSymbol);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = chr(this, varargin)
      % CHR usage: chr() : returns unsigned char
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % chr()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(812, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.chr');
      end
    end

    function varargout = index(this, varargin)
      % INDEX usage: index() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % index()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(813, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.index');
      end
    end

    function varargout = key(this, varargin)
      % KEY usage: key() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % key()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(814, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.key');
      end
    end

    function varargout = label(this, varargin)
      % LABEL usage: label() : returns unsigned char
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % label()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(815, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.label');
      end
    end

    function varargout = lower(this, varargin)
      % LOWER usage: lower() : returns gtsam::LabeledSymbol
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % lower()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(816, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.lower');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(817, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.print');
      end
    end

    function varargout = upper(this, varargin)
      % UPPER usage: upper() : returns gtsam::LabeledSymbol
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % upper()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(818, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.upper');
      end
    end

  end

  methods(Static = true)
  end
end
