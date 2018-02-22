function varargout = determinant(varargin)
if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesNet')
    varargout{1} = gtsam_wrapper(2125, varargin{:});
elseif length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesTree')
    varargout{1} = gtsam_wrapper(2126, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.determinant');
end
